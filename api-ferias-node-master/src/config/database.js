/**
 * Arquivo: database.js
 * Descrição: Responsável por instanciar conexão com o Banco de Dados
 * Data: 12/05/2020
 * Autor: Matheus Ricardo Brunelli
 */

const { Pool } = require('pg')

// Criar nova conexão com o PostgreSQL. Muito parecido com o PDO :D
const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: '123',
    database: 'dbFerias',
    port: 5432
})

module.exports = pool