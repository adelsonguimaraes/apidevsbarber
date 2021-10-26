# Planejamento - DevsBarber

## Usuários
* Barbeiros Favoritos
* Agendamentos

## Barbeiros
* Fotos
* Notas
* Serviços
* Depoimentos
* Disponibilidade

## tabelas
* users
* userfavorites
* userappoinments
* barbers
* barberphotos
* barberviews
* barberservices
* barbertestemonials
* barberavailability

## Endpoints

* /api/ping (GET)
* /api/auth/login (POST) - Login de usuário
* /api/auth/logout (POST) - Logout de usuário
* /api/auth/refresh (POST) - Atualização de Token
* /api/auth/user (POST) - Cadastro de usuário

##

* /api/user (GET)
* /api/user (PUT) - Atualização de usuário
* /api/user/avatar (POST) - Atualização de avatar
* /api/user/favorites (GET) - Lista de Favoritos
* /api/user/favorite (POST) - Favoritar
* /api/user/appointments (GET) - Lista de agendamentos

##

* /api/barbers (GET) - Lista de Barbeiros
* /api/barber/{id} (GET) - Buscar Barbeiro por ID
* /api/barber/{id}/appointment (POST) - Agendamento

##

* /api/search (GET) - Buscar por barbeiro