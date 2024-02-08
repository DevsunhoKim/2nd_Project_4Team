// basic-N3 [uFLsb2Fh4v]
(function() {
  $(function() {
    $(".basic-N3").each(function() {
      const $block = $(this);
      const $dim = $block.find('.header-dim');
      // Header Scroll
      $(window).on("load scroll", function() {
        const $thisTop = $(this).scrollTop();
        if ($thisTop > 120) {
          $block.addClass("header-top-active");
        } else {
          $block.removeClass("header-top-active");
        }
      });
      // Header Mobile 1Depth Click
      if (window.innerWidth <= 992) {
        $block.find(".header-gnbitem").each(function() {
          const $gnblink = $(this).find(".header-gnblink");
          const $sublist = $(this).find(".header-sublist");
          if ($sublist.length) {
            $gnblink.attr("href", "javascript:void(0);");
          }
        });
      }
      // Mobile Top
      $block.find('.btn-momenu').on('click', function() {
        $block.addClass('momenu-active');
        $dim.fadeIn();
      });
      $block.find('.btn-close, .header-dim').on('click', function() {
        $block.removeClass('momenu-active');
        $dim.fadeOut();
      });
      // Mobile Gnb
      $block.find('.header-gnbitem').each(function() {
        const $this = $(this);
        const $thislink = $this.find('.header-gnblink');
        $thislink.on('click', function() {
          if (!$(this).parent().hasClass('item-active')) {
            $('.header-gnbitem').removeClass('item-active');
          }
          $(this).parents(".header-gnbitem").toggleClass("item-active");
        });
      });
      // Menu Btn Click Gnb
      $block.find('.btn-allmenu').on('click', function() {
        $block.addClass('header-menuactive');
        $dim.fadeIn();
      });
      $block.find('.btn-close, .header-dim').on('click', function() {
        $block.removeClass('header-menuactive');
        $dim.fadeOut();
      });
    });
  });
})();


// header 스크롤 시 스타일 변경
const header=document.querySelector("header");
const headerHeight=header.getBoundingClientRect().height; // 해당 DOM의 높이를 변수로 지정

window.addEventListener("scroll", () => { // window에 scroll 이벤트를 더한 후
  if (window.scrollY > headerHeight) { // window의 scroll 위치가 DOM의 높이를 넘어설 경우 => window.scrollY
    header.setAttribute("style", "background: #fff;"); // 해당 요소의 스타일 속성을 변경
  } else {
    header.setAttribute("style", "background: transparent;");
  }
});


// basic-N39 [SnLsb2H56a]
(function() {
  $(function() {
    $(".basic-N39").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".basic-N39 .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        loop: true,
        pagination: {
          el: ".basic-N39 .swiper-pagination",
          type: "fraction",
          clickable: true,
        },
        navigation: {
          nextEl: ".basic-N39 .swiper-button-next",
          prevEl: ".basic-N39 .swiper-button-prev",
        },
      });
      // Swiper Play, Pause Button
      const pauseButton = $block.find('.swiper-button-pause');
      const playButton = $block.find('.swiper-button-play');
      playButton.hide();
      pauseButton.show();
      pauseButton.on('click', function() {
        swiper.autoplay.stop();
        playButton.show();
        pauseButton.hide();
      });
      playButton.on('click', function() {
        swiper.autoplay.start();
        playButton.hide();
        pauseButton.show();
      });
    });
  });
})();


// opilsol-N8 [mVLSbF3W3W]
(function() {
  $(function() {
    var swiper = new Swiper(".opilsol-N8 .slide-container", {
      // loop: "true",
      allowTouchMove: false,
      touchEventsTarget: "wrapper",
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      navigation: {
        nextEl: ".opilsol-N8 .swiper-button-next",
        prevEl: ".opilsol-N8 .swiper-button-prev",
      },
      breakpoints: {
        360: {
          slidesPerView: 1.1,
          spaceBetween: 20,
          centeredSlides: true,
        },
        768: {
          slidesPerView: 2.3,
          spaceBetween: 20,
        },
        922: {
          slidesPerView: 3.182,
          spaceBetween: 20,
        },
        1025: {
          slidesPerView: 2.75,
          spaceBetween: 30,
        },
      },
    });
    $(".opilsol-N8 .slide-container .swiper-slide").hover(function() {
      swiper.autoplay.stop();
    }, function() {
      swiper.autoplay.start();
    });
  });
})();


// basic-N42 [lllsB2fhUy]
(function() {
  $(function() {
    $(".basic-N42").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".basic-N42 .contents-swiper", {
        slidesPerView: 'auto',
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        navigation: {
          nextEl: ".basic-N42 .swiper-button-next",
          prevEl: ".basic-N42 .swiper-button-prev",
        },
        pagination: {
          type: "progressbar",
          el: ".basic-N42 .swiper-pagination",
          clickable: true,
        },
      });
    });
  });
})();


// glamping-N33 [wiLsbidq4n]
(function() {
  $(function() {
    $(".glamping-N33").each(function() {
      const $block = $(this);
      const $calendar = $block.find(".contents-date")
      // Date Range Picker
      $calendar.dateRangePicker({
        container: '.glamping-N33 .contents-top',
        // language:'ko',
        language: 'custom',
        inline: true,
        alwaysOpen: true,
      }).bind('datepicker-first-date-selected', function(event, obj) {
        console.log(obj);
      }).bind('datepicker-change', function(event, obj) {
        console.log(obj);
      });
      // Amount Count Button Click Event
      $block.find(".contents-amount").each(function() {
        const $this = $(this);
        const $amountNumElement = $this.find(".contents-amount-num span");
        $this.on("click", ".btn-minus", function() {
          let amountNum = parseInt($amountNumElement.text());
          if (amountNum > 1) {
            amountNum--;
          }
          $amountNumElement.text(amountNum);
        });
        $this.on("click", ".btn-plus", function() {
          let amountNum = parseInt($amountNumElement.text());
          amountNum++;
          $amountNumElement.text(amountNum);
        });
      });
    });
  });
})();


// basic-N1 [DYLSb2ddDK]
(function() {
  $(function() {
    $(".basic-N1").each(function() {
      const $block = $(this);
      const $dim = $block.find('.header-dim');
      // Header Scroll
      $(window).on("load scroll", function() {
        const $thisTop = $(this).scrollTop();
        if ($thisTop > 120) {
          $block.addClass("header-top-active");
        } else {
          $block.removeClass("header-top-active");
        }
      });
      // Header Mobile 1Depth Click
      if (window.innerWidth <= 992) {
        $block.find(".header-gnbitem").each(function() {
          const $gnblink = $(this).find(".header-gnblink");
          const $sublist = $(this).find(".header-sublist");
          if ($sublist.length) {
            $gnblink.attr("href", "javascript:void(0);");
          }
        });
      }
      // Mobile Lang
      $block.find('.header-langbtn').on('click', function() {
        $(this).parent().toggleClass('lang-active');
      });
      // Mobile Top
      $block.find('.btn-momenu').on('click', function() {
        $block.addClass('momenu-active');
        $dim.fadeIn();
      });
      $block.find('.btn-close, .header-dim').on('click', function() {
        $block.removeClass('momenu-active');
        $dim.fadeOut();
      });
      // Mobile Gnb
      $block.find('.header-gnbitem').each(function() {
        const $this = $(this);
        const $thislink = $this.find('.header-gnblink');
        $thislink.on('click', function() {
          if (!$(this).parent().hasClass('item-active')) {
            $('.header-gnbitem').removeClass('item-active');
          }
          $(this).parents(".header-gnbitem").toggleClass("item-active");
        });
      });
      // Menu Btn Click Gnb
      $block.find('.btn-allmenu').on('click', function() {
        $block.addClass('header-menuactive');
        $dim.fadeIn();
      });
      $block.find('.btn-close, .header-dim').on('click', function() {
        $block.removeClass('header-menuactive');
        $dim.fadeOut();
      });
    });
  });
})();


// basic-N5 [BIlSB2dDjn]
(function() {
  $(function() {
    $(".basic-N5").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".basic-N5 .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        pagination: {
          el: ".basic-N5 .swiper-pagination",
          type: "fraction",
          clickable: true,
          renderFraction: function(currentClass, totalClass) {
            return '<span class="' + currentClass + '"></span>' + '<span class="contents-deco"></span>' + '<span class="' + totalClass + '"></span>';
          }
        },
        navigation: {
          nextEl: ".basic-N5 .swiper-button-next",
          prevEl: ".basic-N5 .swiper-button-prev",
        },
      });
      // Swiper Play, Pause Button
      const pauseButton = $block.find('.swiper-button-pause');
      const playButton = $block.find('.swiper-button-play');
      playButton.hide();
      pauseButton.show();
      pauseButton.on('click', function() {
        swiper.autoplay.stop();
        playButton.show();
        pauseButton.hide();
      });
      playButton.on('click', function() {
        swiper.autoplay.start();
        playButton.hide();
        pauseButton.show();
      });
    });
  });
})();


// basic-N9 [cClsB2dE94]
(function() {
  $(function() {
    $(".basic-N9").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".basic-N9 .contents-swiper", {
        slidesPerView: 'auto',
        allowTouchMove: false,
        spaceBetween: 0,
        loop: true,
        navigation: {
          nextEl: ".basic-N9 .swiper-button-next",
          prevEl: ".basic-N9 .swiper-button-prev",
        },
      });
    });
  });
})();