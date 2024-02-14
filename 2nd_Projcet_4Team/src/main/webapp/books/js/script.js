// hooms-N40 [oylSl2orEZ]
(function() {
  $(function() {
    $(".hooms-N40").each(function() {
      const $block = $(this);
      const $thumbnail = $block.find('.contents-thumbnail img');
      const $thumbitem = $block.find('.contents-thumbitem img');
      // Thumbnail Click Event
      $thumbitem.each(function(index, element) {
        var $this = $(this);
        $this.on("click", changePic);
      });

      function changePic() {
        var newPic = $(this).attr("src");
        $thumbnail.attr("src", newPic);
      }
    });
  });
})();;