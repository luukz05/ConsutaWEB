<template>
   <nav>
        <form class="form-inline" @submit.prevent="pesquisarOperadora" method="get">
            <input v-model="operadora" class="form-control mr-sm-2" type="search" placeholder="Digite a operadora" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
        </form>
    </nav>
</template>

<style scoped>
    .form-inline{
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: row;
        gap: 10px;
    }
    nav{
        background-color: rgba(255, 255, 255, 0);
        border-radius: 5px;
    }
</style>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            operadora: ''
        };
    },
    methods: {
        pesquisarOperadora() {
            console.log("Buscando operadora: " + this.operadora);
            // chamada da api com o axios
            axios.get(`http://127.0.0.1:5000/rand`)
                .then(response => {
                    console.log(response.data);
                    document.getElementsByClassName("response")[0].innerHTML = response.data;
                })
                .catch(error => {
                    console.error(error);
                });
        }
    }
}
</script>
