<script>
    import { page } from '$app/stores';
    export let title;
    export let path;
    $: isSelected = $page.url.pathname === path;
    let defaultStyles =
        'flex flex-row justify-start items-center gap-4 rounded-lg p-4 transition-colors duration-200 ';
    let selectedStyles = defaultStyles + 'bg-white';
</script>

<a href={path} class={isSelected ? selectedStyles : defaultStyles}>
    <span class="h-6 w-6">
        <slot />
    </span>
    {title}
</a>
