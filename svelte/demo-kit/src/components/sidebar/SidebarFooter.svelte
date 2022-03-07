<script>
    const handleSignOut = () => {
        fetch('/api/signout', {
            method: 'POST'
        }).then(_ => {
            window.location.href = '/login';
        });
    };
</script>

<div class="w-full p-2">
    <button on:click={handleSignOut} class="text-skin-main-accent"> Sign out </button>
</div>
