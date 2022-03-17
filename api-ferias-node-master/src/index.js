/**
 * Arquivo: index.js
 * Descrição: Responsável por por chamar a API da aplicação
 * Data: 12/05/2020
 * Autor: Matheus Ricardo Brunelli
 */

// Dependências necessárias para trabalhar com rotas e segurança
const express = require('express')
const cors = require('cors')
const app = express()

// Retornar dados em JSON
app.use(express.json())

/* 
    Proteção contra outras aplicações
    Origin: Tipos de dados que o backend aceita. * = todos.
    Headers: Quem pode fazer requisição ao nosso backend. * = todos.
    Methods: Métodos que podem acessar nosso backend. GET, PUT, POST, DELETE. (quase todos)
*/
app.use((req, res, next) => {
    console.log('Acessou o Middleware!')
    res.header("Access-Control-Allow-Origin", "*")
    res.header('Access-Control-Allow-Headers', '*')
    res.header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE")
    app.use(cors())
    next()
})

// A Rota inicial será a /api
app.use('/api', require('./routes'))

// Ouvindo aplicação na porta 8080
app.listen(8080, () => {
    console.log('Servidor iniciado na porta 8080: http://localhost:8080/')
})