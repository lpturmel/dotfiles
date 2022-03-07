<script>
    import Divider from '../../components/ui/Divider.svelte';
    import { userStore } from '../../stores/userStore';
</script>

<div>
    <h1>Hi {$userStore.displayName}!</h1>
    <Divider />
    <p>Libs page</p>
</div>
