<script setup>
  import Pesquisa from './components/Pesquisa.vue';
</script>

<template>
  <header>
    <h1 class="titulo">Buscar operadoras ativas na ANS</h1>
    <Pesquisa />
  </header>
</template>

<style>
  h1 {
    color: #eee;
    font-size: 50pt;
  }
  header{
    padding: 20px;
    text-align: center;
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }
</style>
