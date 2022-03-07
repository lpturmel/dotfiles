<script>
    import { userStore } from '../../stores/userStore';
</script>

<div class="flex flex-col items-center justify-center">
    <p class="font-semibold">{$userStore.displayName}</p>
    <p class="truncate text-xs">{$userStore.userPrincipalName}</p>
</div>
