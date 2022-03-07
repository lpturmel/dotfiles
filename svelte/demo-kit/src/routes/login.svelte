<script context="module">
    export async function load({ session }) {
        if (session?.user) {
            return { status: 302, redirect: '/dashboard/libs' };
        }
        return {
            props: {}
        };
    }
</script>

<script lang="ts">
    import MicrosoftLogo from '../components/ui/MicrosoftLogo.svelte';

    const redirect_uri = encodeURIComponent('http://localhost:3000/api/oauth');
    const scope = encodeURIComponent(
        'openid offline_access https://graph.microsoft.com/mail.read'
    );
    let oauth_url = `https://login.microsoftonline.com/53244bbe-ee09-4ab0-9f7f-a4854b23a664/oauth2/v2.0/authorize?client_id=87343338-7e9c-4d87-8f86-a605cefa4092&response_type=code&redirect_uri=${redirect_uri}&response_mode=query&scope=${scope}`;
</script>

<div
    class="container m-auto flex h-full w-full max-w-sm flex-col items-center justify-start gap-4 pt-40"
>
    <h1 class="w-full text-center text-3xl font-bold text-skin-main-accent">Sign in</h1>
    <a
        href={oauth_url}
        class="flex w-60 flex-row items-center justify-start gap-4 rounded-md border border-gray-500 p-2"
        ><MicrosoftLogo />Sign in with Microsoft</a
    >
</div>
