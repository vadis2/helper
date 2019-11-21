````
<script>
        jQuery(function ($) {
            function fix_size() {
                var images = $('.img-container img');
                images.each(setsize);

                function setsize() {
                    var img = $(this),
                        img_dom = img.get(0),
                        container = img.parents('.img-container');
                    if (img_dom.complete) {
                        resize();
                    } else img.one('ready', resize);

                    function resize() {
                        if ((container.width() / container.height()) < (img_dom.width / img_dom.height)) {
                            img.width('100%');
                            img.height('auto');
                            return;
                        }
                        img.height('100%');
                        img.width('auto');
                    }
                }
            }

            $(window).on('resize', fix_size);
            fix_size();
        });
    </script>
````