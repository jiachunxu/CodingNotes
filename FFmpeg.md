# FFmpeg

### ffmpeg 合并ts命令:

``` shell
    ffmpeg -i xxx.m3u8 -vcodec copy -acodec copy xxx.mp4
```

### 音频视频合并命令:

```shell 
ffmpeg -i "音频文件名" -i "视频文件名"  -c copy "output.mp4"
ffmpeg -i "834297465_nb3-1-30280.m4s" -i "834297465-1-100026.m4s" -c copy "output.mp4"
``` 

### ffmpeg 长视频切片命令:

```shell
ffmpeg -i input.mp4 -c copy -map 0 -segment_time 10 -f segment -reset_timestamps 1 -map_metadata -1 output%03d.mp4

#    -i input.mp4：指定输入文件。
#    -c copy：复制编解码器，避免重新编码，保持视频质量。
#    -map 0：从输入文件中复制所有流（视频、音频等）。
#    -segment_time 10：设置每个输出段的持续时间，这里是10秒。
#    -f segment：指定输出格式为分段。
#    -reset_timestamps 1：重置时间戳，确保每个片段都是从0开始。
#    -map_metadata -1：不复制任何元数据到输出文件，刷新元数据。
#    output%03d.mp4：设置输出文件的命名模式。

# 使用 ffmpeg 将视频切片成每段10秒，并保持视频的清晰度不变 ()
ffmpeg -i input.mp4 -c copy -map 0 -f segment -segment_time 10 -segment_list playlist.m3u8 -segment_list_entry_prefix /path/to/segments/ output%03d.ts

ffmpeg -i input.mp4 -f segment -segment_time 10 -segment_format avi output_%d.avi
ffmpeg -i input.mp4 -f segment -segment_time 10 -segment_format mp4 output_%d.mp4

# (  copy 复制原视频编码格式  )
    ffmpeg -i input.mp4 -f segment -segment_time 10 -segment_format copy output_%d.mp4
```

### ffmpeg 提取音频命令:
```shell
# a：音频流
# v：视频流
# s：字幕流
# d：数据流
# t：附件流
ffmpeg -i input.mp4 -vn -acodec copy output.aac

ffmpeg -i input.mp4 -map a: all_audio.mp3

ffmpeg -i input.mp4 -map v: all_video.mp4
```
### ffmpeg 视频旋转命令:
```bash
# 对于旋转视频，常用的过滤器是transpose
# 0：不旋转（默认值）
# 1：顺时针旋转90度
# 2：旋转180度
# 3：逆时针旋转90度
ffmpeg -i input.mp4 -vf "transpose=1" output.mp4
ffmpeg -i input.mp4 -vf "transpose=1" -c:a copy output.mp4
```