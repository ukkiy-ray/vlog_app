if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const VideoList = document.getElementById('video-list');

    // 選択した画像を表示する関数
    const createVideoHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const videoElement = document.createElement('div');

     // 表示する画像を生成
     const blobVideo = document.createElement('video');
     blobVideo.setAttribute('src', blob);
     // 生成したHTMLの要素をブラウザに表示させる
     videoElement.appendChild(blobVideo);
     VideoList.appendChild(videoElement);
   };

    document.getElementById('post_video').addEventListener('change', function(e){
      const videoContent = document.querySelector('video');
      if (videoContent){
        videoContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createVideoHTML(blob);
    });
  });
}