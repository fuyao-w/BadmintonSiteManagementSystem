<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
    <meta name="renderer" content="webkit">
    <title>≤‚ ‘“≥√Ê</title>
    <style>
        body{margin:0;text-align: center;}
        video{max-width: 1200px;width: 100%;}
    </style>
</head>
<script>
</script>
<body>
<script src="https://open.ys7.com/sdk/js/1.3/ezuikit.js"></script>

<video id="myPlayer" poster="" controls playsInline webkit-playsinline autoplay>
    <source src="rtmp://rtmp.open.ys7.com/openlive/3944455eae064d0684dfd8defec2adde.hd" type="" />
    <source src="http://hls.open.ys7.com/openlive/3944455eae064d0684dfd8defec2adde.hd.m3u8" type="application/x-mpegURL" />

</video>

<script>
    var player = new EZUIPlayer('myPlayer');
    player.on('error', function(){
        console.log('error');
    });
    player.on('play', function(){
        console.log('play');
    });
    player.on('pause', function(){
        console.log('pause');
    });

</script>
</body>
</html>