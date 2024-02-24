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

// hooms-N45 [vfLsO0j77a]
(function() {
  $(function() {
    $(".hooms-order-N1").each(function() {
      const $block = $(this);
      // order Textarea Count
      $block.find("textarea").on("keyup", function() {
        var orderText = $(this).val();
        if (orderText.length == 0 || orderText == "") {
          $block.find(".order-text-count").text("0자");
        } else {
          $block.find(".order-text-count").text(orderText.length);
        }
        if (orderText.length > 4000) {
          $(this).val($(this).val().substring(0, 4000));
        }
      });
      // order File Cancel Button
      $block.find('.order-form-file').each(function() {
        const $this = $(this);
        $this.find('.fileset-input').on('change', function() {
          $(this).siblings('.fileset-btn-cancel').show();
        });
        $this.find('.fileset-btn-cancel').on('click', function() {
          $(this).siblings('.fileset-input').val('');
          $(this).hide();
        });
      });
    });
  });
})();;