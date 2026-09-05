<script setup lang="ts">
import LoginUser from '@/components/LoginUser.vue'
</script>
<template>
        <main>
                <h1 class="blue text-center">Kansas First Bank</h1>
                <LoginUser />
        </main>
</template>

<style scoped>
main {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 60vh;
    padding: 1rem;
}
.blue {
    color: #0f5076;
    font-size: 1.75rem;
    margin: 0 0 0.25rem 0;
    text-align: center;
}
</style>