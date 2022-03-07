<script context="module">
    export async function load({ session }) {
        if (!session?.user) {
            return { status: 302, redirect: '/login' };
        }
        return {
            props: {
                user: session.user
            }
        };
    }
</script>

<script>
    import { userStore } from '../../stores/userStore';

    import Sidebar from '../../components/sidebar/index.svelte';
    export let user;

    userStore.set(user);
</script>

<div class="flex h-full w-full flex-row">
    <Sidebar />
    <div class="h-full w-full p-4">
        <slot />
    </div>
</div>
