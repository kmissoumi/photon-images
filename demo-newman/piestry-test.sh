#!/bin/bash


# example 1 / validated request with dynamically generated response
curl --config ./etc/curl.conf http://localhost:6000/api/retail/product


# example 2 / bad request / consumer contract violation
productId="one"
curl --config ./etc/curl.conf http://localhost:6000/api/retail/product/${productId}


# example 3 / validated request with static response from ./specs/examples/user_id_3.json / response passes schema validation
userId="3"
curl --config ./etc/curl.conf http://localhost:6000/api/user/${userId}


# example 4 / validated request with static response from ./specs/examples/user_id_4.json / response fails schema validation
userId="4"
curl --config ./etc/curl.conf http://localhost:6000/api/user/${userId}