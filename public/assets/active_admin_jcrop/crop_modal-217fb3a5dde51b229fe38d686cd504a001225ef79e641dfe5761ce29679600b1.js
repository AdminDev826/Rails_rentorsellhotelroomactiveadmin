(function() {
  window.active_admin_jcrop = {
    start: function() {
      var update_cropper;
      if ($('.crop_modal_open').length) {
        $('.crop_modal_open').click(function() {
          var content, image, options;
          content = $(this).parent().find('.crop_modal_content').clone();
          image = content.find('img.cropping_image');
          active_admin_jcrop.buttons_text = {
            save_cropped_image: image.data('translateSaveCroppedImage'),
            cancel: image.data('translateCancel')
          };
          active_admin_jcrop.cropper = {
            object_class: image.data('objectClass'),
            object_id: image.data('objectId'),
            crop_field: image.data('cropField'),
            jcropper_url: image.data('jcropperUrl')
          };
          $(content).appendTo('body').dialog({
            width: content.width(),
            height: content.height() + 100,
            modal: true,
            position: {
              my: "center",
              at: "center",
              of: window
            },
            buttons: [
              {
                text: active_admin_jcrop.buttons_text.save_cropped_image,
                click: function() {
                  var cropper;
                  ({
                    text: 'aews'
                  });
                  cropper = active_admin_jcrop.cropper;
                  return $.ajax({
                    type: 'PUT',
                    url: cropper.jcropper_url,
                    data: {
                      image_data: cropper
                    },
                    error: function() {
                      return alert('There was an error while cropping the image');
                    }
                  }, $(this).dialog('close'));
                }
              }, {
                text: active_admin_jcrop.buttons_text.cancel,
                click: function() {
                  return $(this).dialog('close').remove();
                }
              }
            ]
          });
          options = $.extend({}, image.data('jcropOptions'));
          options.onSelect = function(coords) {
            var fn;
            update_cropper(coords);
            if (image.data('jcropOptions').showDimensions) {
              content.find('.crop_modal_dimensions').first().text(coords.w + "x" + coords.h);
            }
            if (fn = image.data('jcropOptions').onSelect) {
              if (typeof fn === 'string') {
                window[fn](coords);
              } else if (typeof fn === 'function') {
                fn(coords);
              }
            }
          };
          options.onChange = function(coords) {
            var fn;
            update_cropper(coords);
            if (image.data('jcropOptions').showDimensions) {
              content.find('.crop_modal_dimensions').first().text(coords.w + "x" + coords.h);
            }
            if (fn = image.data('jcropOptions').onChange) {
              if (typeof fn === 'string') {
                window[fn](coords);
              } else if (typeof fn === 'function') {
                fn(coords);
              }
            }
          };
          options.onRelease = function() {
            var fn;
            if (fn = image.data('jcropOptions').onRelease) {
              if (typeof fn === 'string') {
                window[fn](coords);
              } else if (typeof fn === 'function') {
                fn(coords);
              }
            }
          };
          image.Jcrop(options);
        });
        update_cropper = function(coords) {
          active_admin_jcrop.cropper.crop_x = coords.x;
          active_admin_jcrop.cropper.crop_y = coords.y;
          active_admin_jcrop.cropper.crop_w = coords.w;
          active_admin_jcrop.cropper.crop_h = coords.h;
        };
      }
    }
  };

  $(function() {
    return active_admin_jcrop.start();
  });

}).call(this);
