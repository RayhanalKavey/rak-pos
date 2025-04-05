<script setup>
import { Link, useForm, usePage, router } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
const toaster = createToaster({ position: "top-right" });
import { ref, watch } from "vue";

let page = usePage();
const Header = [
    { text: "Name", value: "name" },
    { text: "Action", value: "number" },
];
const Item = ref(page.props.categories);
// This will re-fetch the current page and update the props

watch(
    () => page.props.categories,
    (newVal) => {
        Item.value = newVal;
    }
);
const searchValue = ref();
const DeleteClick = (id) => {
    let text = "Are you sure you want to delete this category?";
    if (confirm(text) === true) {
        router.delete(`/delete-category/${id}`, {
            onSuccess: () => {
                // toaster.success(usePage().props.flash.message);
                // toaster.success("Category Deleted successfully");
                toaster.success(page.props.flash.message);
            },
            preserveScroll: true,
        });
        // This will re-fetch the current page and update the props
        // router.visit("/category", { replace: true, preserveScroll: true });
    } else {
        text = "you canceled!";
    }
};
</script>

<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12"></div>
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div>
                            <h3>Category</h3>
                        </div>
                        <hr />
                        <div class="float-end">
                            <Link
                                href="/category-save?id=0"
                                class="btn btn-success mx-3 btn-sm"
                            >
                                Add Category
                            </Link>
                        </div>

                        <!-- Modal -->

                        <div>
                            <input
                                placeholder="Search..."
                                class="form-control mb-2 w-auto form-control-sm"
                                type="text"
                                v-model="searchValue"
                            />
                            <EasyDataTable
                                buttons-pagination
                                alternating
                                :headers="Header"
                                :items="Item"
                                :rows-per-page="10"
                                :search-field="searchField"
                                :search-value="searchValue"
                                show-index
                            >
                                <template #item-number="{ id, name }">
                                    <a
                                        class="btn btn-success mx-3 btn-sm"
                                        :href="`/category-save?id=${id}`"
                                        >Edit</a
                                    >
                                    <button
                                        class="btn btn-danger btn-sm"
                                        @click="DeleteClick(id)"
                                    >
                                        Delete
                                    </button>
                                </template>
                            </EasyDataTable>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
