<div {!! $attributes !!}>
    <div class="inner">
        <h3>{{ $info }}</h3>

        <p>{{ $name }}</p>
    </div>
    <div class="icon">
        <i class="fa fa-{{ $icon }}"></i>
    </div>
    <a href="{{ $link }}" target="_blank" class="small-box-footer">
        {{ $more }}&nbsp;
        <i class="fa fa-arrow-circle-right"></i>
    </a>
</div>