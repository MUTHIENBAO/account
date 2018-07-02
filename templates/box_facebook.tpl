<?php
    if($fb_show == 1) {
?>
<div id="facebook_plugin">
    <?php if($fb_like_fanpage == 1) { ?>
    <hr />
    <div id="fb_fanpage_like">
        <strong><font color='red'>Like</font></strong> (<strong><font color='red'>Thích</font></strong>) FanPage để <strong>giảm <?php echo $fb_like_fanpage_decre_price; ?>% phí</strong> khi <strong>Reset VIP</strong><br />
        Nếu bạn đã Like mà chưa được giảm <?php echo $fb_like_fanpage_decre_price; ?>% phí Reset VIP, hãy Dislike và Like lại.
        <br /><br />
        <div style="clear: both;" class="fb-like" data-href="<?php echo $fb_fanpage_url; ?>" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div><br />
        <div style="clear: both;" id="fb_fanpage_like_err"></div>
    </div>
    <?php } ?>
    <?php if(isset($fb_post_link_get) && strlen($fb_post_link_get) > 8) { ?>
    <hr />
    <div style="clear: both;" class="fb-post" data-href="<?php echo $fb_post_link_get; ?>"></div>
    <br /><strong><font color='red'>Like</font></strong> (<strong><font color='red'>Thích</font></strong>) càng nhiều, bạn chơi càng đông. Thêm bạn thêm vui.
    <?php } ?>
</div>

<?php } ?>