<div class="primary-block out-top-20">
    <div class="main-content">
        <ul class="tabs-content">
            <li <?php if(!$_GET['page']) echo 'class="active"'; ?>>
                <a href="#event&act=event_epitem" rel="ajax">Giới thiệu Event</a>
            </li>
            <li <?php if($_GET['page'] == 'event_epitem_regnew') echo 'class="active"'; ?>>
                <a href="#event&act=event_epitem&page=event_epitem_regnew" rel="ajax">Đăng ký Item</a>
            </li>
            <li <?php if($_GET['page'] == 'event_epitem_reged') echo 'class="active"'; ?>>
                <a href="#event&act=event_epitem&page=event_epitem_reged" rel="ajax">Item đã Đăng ký Item</a>
            </li>
            <li <?php if($_GET['page'] == 'event_epitem_rank') echo 'class="active"'; ?>>
                <a href="#event&act=event_epitem&page=event_epitem_rank" rel="ajax">Xếp hạng</a>
            </li>
        </ul>
    </div>
</div>