<script>
    import SidebarFooter from './SidebarFooter.svelte';

    import SidebarHeader from './SidebarHeader.svelte';
    import SidebarItem from './SidebarItem.svelte';
    import { BookIcon, FolderIcon } from 'svelte-feather-icons';
</script>

<div class="flex w-[300px] flex-col justify-between gap-2 bg-[#ECECF4] p-4">
    <div class="flex w-full flex-col gap-4">
        <SidebarHeader />

        <div class="flex w-full flex-col">
            <SidebarItem title="Libs" path="/dashboard/libs">
                <BookIcon />
            </SidebarItem>
            <SidebarItem title="Apps" path="/dashboard/apps">
                <FolderIcon />
            </SidebarItem>
        </div>
    </div>
    <SidebarFooter />
</div>
