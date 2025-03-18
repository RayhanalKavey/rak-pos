<script setup>
import { Link } from "@inertiajs/vue3";
</script>

<template>
    <button class="btn btn-success">Home page</button>
    <nav>
        <Link href="/test">Test Page</Link>
        <Link href="/">Home</Link>
    </nav>
</template>

<style scoped></style>
