<template>
    <nav>
        <form class="form-inline" @submit.prevent="pesquisarOperadora">
            <input v-model="operadora" class="form-control mr-sm-2" type="search" placeholder="Digite a operadora"
                aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
        </form>
    </nav>

    <div v-if="resposta && resposta.length > 0" class="response">
        <h4>Informações:</h4>
        <div v-for="(operadora, index) in resposta" :key="index">

            <ul>
                <li><strong>Nome Fantasia:</strong> {{ operadora.Nome_Fantasia }}</li>
                <li><strong>Razão Social:</strong> {{ operadora.Razao_Social }}</li>
                <li><strong>CNPJ:</strong> {{operadora.CNPJ}}</li>
                <li><strong>Endereço:</strong> {{ operadora.Logradouro }}, {{ operadora.Numero }} - {{ operadora.Bairro
                    }}, {{ operadora.Cidade }} - {{ operadora.UF }}</li>
                <li><strong>Telefone:</strong> (0{{operadora.DDD}}) {{ operadora.Telefone }}</li>
                <li><strong>Email:</strong> {{ operadora.Endereco_eletronico }}</li>
                <li><strong>Data de Registro ANS:</strong> {{ new Date(operadora.Data_Registro_ANS).toLocaleDateString()
                    }}</li>
            </ul>

            <hr />
        </div>
    </div>

    <div v-else-if="resposta && resposta.length === 0" class="response">
        <p>Nenhuma operadora encontrada.</p>
    </div>

    <div v-else-if="resposta && typeof resposta === 'string'" class="response">
        <p>{{ resposta }}</p>
    </div>
</template>

<style scoped>
.form-inline {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    gap: 10px;
}

nav {
    background-color: rgba(255, 255, 255, 0);
    border-radius: 5px;
}

.response {
    margin-top: 15px;
    font-family: monospace;
    white-space: pre-wrap;
}

.response ul {
    list-style-type: none;
    padding: 0;
}

.response li {
    margin-bottom: 5px;
}

hr {
    margin-top: 10px;
    margin-bottom: 10px;
    border: 0;
    border-top: 1px solid #ccc;
}
</style>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            operadora: '', //dado input
            resposta: null, //dado retorno api
        };
    },
    methods: {
        pesquisarOperadora() {
            if (this.operadora === '') {
                console.log('input vazio');
                return;
            }
            axios.get(`http://127.0.0.1:5000/consulta/?nome_busca=${this.operadora}`)
                .then(response => {
                    console.log(response.data);
                    this.resposta = response.data;
                })
                .catch(error => {
                    console.error(error);
                    this.resposta = `Erro na consulta: ${error.message}`;
                });
        }

    }
}
</script>
