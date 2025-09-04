import { describe, expect, test } from 'vitest';
import { BaseConfig } from 'src/utils/media';
import { VideoCodec, TranscodeHardwareAcceleration, ToneMapping, CQMode } from 'src/enum';
import { VideoStreamInfo } from 'src/types';

// Test configuration
const defaultConfig = {
  targetResolution: '720',
  targetVideoCodec: VideoCodec.H264,
  accel: TranscodeHardwareAcceleration.Disabled,
  tonemap: ToneMapping.Disabled,
  crf: 23,
  preset: 'ultrafast',
  twoPass: false,
  threads: 0,
  maxBitrate: '0',
  bframes: -1,
  refs: 0,
  gopSize: 0,
  npl: 0,
  temporalAQ: false,
  cqMode: CQMode.Crf,
  acceptedVideoCodecs: [VideoCodec.H264],
  acceptedAudioCodecs: [],
  acceptedContainers: [],
  preferredHwDevice: 'auto'
};

describe('Media Resolution Logic Tests', () => {
  let config: BaseConfig;

  beforeEach(() => {
    config = new BaseConfig(defaultConfig);
  });

  describe('getTargetResolution', () => {
    test('should return parsed config value when not original', () => {
      const landscapeVideo: VideoStreamInfo = {
        index: 0,
        height: 1080,
        width: 1920,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const result = config.getTargetResolution(landscapeVideo);
      expect(result).toBe(720);
    });

    test('should return maximum dimension when targetResolution is original', () => {
      const originalConfig = { ...defaultConfig, targetResolution: 'original' };
      const configOriginal = new BaseConfig(originalConfig);
      
      const landscapeVideo: VideoStreamInfo = {
        index: 0,
        height: 1080,
        width: 1920,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const portraitVideo: VideoStreamInfo = {
        index: 0,
        height: 1920,
        width: 1080,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      // Now should return the maximum dimension (1920) for both
      expect(configOriginal.getTargetResolution(landscapeVideo)).toBe(1920);
      expect(configOriginal.getTargetResolution(portraitVideo)).toBe(1920);
    });
  });

  describe('getScaling', () => {
    test('should scale largest dimension for landscape videos', () => {
      const landscapeVideo: VideoStreamInfo = {
        index: 0,
        height: 1080,
        width: 1920,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const result = config.getScaling(landscapeVideo);
      expect(result).toBe('720:-2'); // width 720 (largest dimension), height auto
    });

    test('should scale largest dimension for portrait videos', () => {
      const portraitVideo: VideoStreamInfo = {
        index: 0,
        height: 1920,
        width: 1080,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const result = config.getScaling(portraitVideo);
      expect(result).toBe('-2:720'); // width auto, height 720 (largest dimension)
    });
  });

  describe('getSize', () => {
    test('should scale largest dimension to target for both orientations', () => {
      const landscapeVideo: VideoStreamInfo = {
        index: 0,
        height: 1080,
        width: 1920,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const portraitVideo: VideoStreamInfo = {
        index: 0,
        height: 1920,
        width: 1080,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const landscapeSize = config.getSize(landscapeVideo);
      const portraitSize = config.getSize(portraitVideo);

      // Both should have same pixel count and follow "largest dimension = 720" rule
      expect(landscapeSize).toEqual({ width: 720, height: 404 }); // 720 * (1080/1920) = 405 -> rounds to 404
      expect(portraitSize).toEqual({ width: 404, height: 720 }); // 720 * (1080/1920) = 405 -> rounds to 404

      const landscapePixels = landscapeSize.width * landscapeSize.height;
      const portraitPixels = portraitSize.width * portraitSize.height;
      expect(landscapePixels).toBe(portraitPixels);
      expect(landscapePixels).toBe(290880); // 720 * 404 = 290,880 (much smaller than before)
    });

    test('should work correctly with different aspect ratios', () => {
      const wideVideo: VideoStreamInfo = {
        index: 0,
        height: 540,
        width: 1920,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const tallVideo: VideoStreamInfo = {
        index: 0,
        height: 1920,
        width: 540,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const wideSize = config.getSize(wideVideo);
      const tallSize = config.getSize(tallVideo);

      // Wide: width (1920) scales to 720, height scales proportionally: 720 * (540/1920) = 202.5 -> 202
      expect(wideSize).toEqual({ width: 720, height: 202 });
      
      // Tall: height (1920) scales to 720, width scales proportionally: 720 * (540/1920) = 202.5 -> 202
      expect(tallSize).toEqual({ width: 202, height: 720 });

      const widePixels = wideSize.width * wideSize.height;
      const tallPixels = tallSize.width * tallSize.height;
      expect(widePixels).toBe(tallPixels);
    });
  });

  describe('shouldScale', () => {
    test('should correctly determine when landscape video needs scaling based on largest dimension', () => {
      const largeVideo: VideoStreamInfo = {
        index: 0,
        height: 1080,
        width: 1920, // largest = 1920 > 720, should scale
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const smallVideo: VideoStreamInfo = {
        index: 0,
        height: 480,
        width: 640, // largest = 640 < 720, should not scale
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      expect(config.shouldScale(largeVideo)).toBe(true); // max(1920, 1080) = 1920 > 720
      expect(config.shouldScale(smallVideo)).toBe(false); // max(640, 480) = 640 < 720
    });

    test('should correctly determine when portrait video needs scaling based on largest dimension', () => {
      const largePortraitVideo: VideoStreamInfo = {
        index: 0,
        height: 1920, // largest = 1920 > 720, should scale
        width: 1080,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const smallPortraitVideo: VideoStreamInfo = {
        index: 0,
        height: 640, // largest = 640 < 720, should not scale
        width: 480,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      expect(config.shouldScale(largePortraitVideo)).toBe(true); // max(1920, 1080) = 1920 > 720
      expect(config.shouldScale(smallPortraitVideo)).toBe(false); // max(640, 480) = 640 < 720
    });

    test('should handle edge case where largest dimension equals target', () => {
      const exactVideo: VideoStreamInfo = {
        index: 0,
        height: 720,
        width: 1280,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      // max(720, 1280) = 1280 > 720, should scale
      expect(config.shouldScale(exactVideo)).toBe(true);
    });
  });

  describe('Fixed behavior: documentation compliance', () => {
    test('new implementation follows documentation - largest dimension scales to target', () => {
      const landscapeVideo: VideoStreamInfo = {
        index: 0,
        height: 1080,
        width: 1920,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const portraitVideo: VideoStreamInfo = {
        index: 0,
        height: 1920,
        width: 1080,
        rotation: 0,
        frameCount: 1000,
        isHDR: false,
        bitrate: 5000000,
        pixelFormat: 'yuv420p'
      };

      const landscapeSize = config.getSize(landscapeVideo);
      const portraitSize = config.getSize(portraitVideo);

      // Documentation: "downscale the largest dimension to this value"
      // Landscape: largest dimension (1920) becomes 720
      expect(landscapeSize.width).toBe(720); // largest dimension
      expect(landscapeSize.height).toBe(404); // scaled proportionally (720 * 1080/1920 = 405 -> rounds to 404)
      
      // Portrait: largest dimension (1920) becomes 720  
      expect(portraitSize.height).toBe(720); // largest dimension
      expect(portraitSize.width).toBe(404); // scaled proportionally (720 * 1080/1920 = 405 -> rounds to 404)

      // Both should have equivalent quality (same pixel count)
      const landscapePixels = landscapeSize.width * landscapeSize.height;
      const portraitPixels = portraitSize.width * portraitSize.height;
      expect(landscapePixels).toBe(portraitPixels);
    });
  });
});