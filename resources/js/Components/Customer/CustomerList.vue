<script setup>
import { usePage, router, Link } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
const toaster = createToaster();
import { ref, watch } from "vue";

let page = usePage();

const Header = [
    { text: "Name", value: "name" },
    { text: "Email", value: "email" },
    { text: "Mobile", value: "mobile" },
    { text: "Action", value: "action" },
];

const Item = ref(page.props.customers);
const searchValue = ref();

watch(
    () => page.props.customers,
    (newVal) => {
        Item.value = newVal;
    }
);

const DeleteClick = (id) => {
    let text = "Are you sure you want to delete this customer?";
    if (confirm(text) === true) {
        router.delete(`/delete-customer/${id}`, {
            onSuccess: () => {
                toaster.success(page.props.flash.message);
                // toaster.success("Customer Deleted Successfully");
            },
            preserveScroll: true,
        });
    } else {
        text = "You canceled!";
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
                            <h3>Customer</h3>
                        </div>
                        <hr />
                        <div class="float-end">
                            <Link
                                href="/customer-save?id=0"
                                class="btn btn-success mx-3 btn-sm"
                            >
                                Add Customer
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
                                <template #item-action="{ id }">
                                    <Link
                                        class="btn btn-success mx-3 btn-sm"
                                        :href="`/customer-save?id=${id}`"
                                        >Edit
                                    </Link>
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
