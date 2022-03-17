/**
 * Arquivo: routes.js
 * Descrição: Gerenciar rotas da aplicação
 * Data: 12/05/2020
 * Autor: Matheus Ricardo Brunelli
 */

const express = require('express')
const routes = express.Router()

const ColaboradorController = require('./controllers/ColaboradorController')
const FilialController = require('./controllers/FilialController')
const FeriasController = require('./controllers/FeriasController')

// Rota Colaborador
routes.get('/colaborador', ColaboradorController.listAll)
routes.get('/colaborador/:id', ColaboradorController.listById)
routes.get('/colaborador/filial/:id', ColaboradorController.listByFilialId)

// Rota Filial
routes.get('/filial', FilialController.listAll)
routes.get('/filial/:id', FilialController.listById)

// Rota Férias
routes.get('/ferias', FeriasController.listAll)
routes.get('/ferias/:id', FeriasController.listById)
routes.post('/ferias', FeriasController.createNew)
routes.delete('/ferias/:id', FeriasController.deleteById)
routes.get('/ferias/colaborador/:id', FeriasController.listAllOfColaborador)

module.exports = routes