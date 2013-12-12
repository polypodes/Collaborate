Bonjour,

afin de remonter l'équivalent de l'environnement de production actuel sur un serveur local de développement (vagrant+puppet),
nous aurions besoin de connaître les modules et la configuration détaillée du stack LAMP :

A cette fin, et n'ayant pas accès à SSH, pourriez-vous svp nous indiquer le résultat des commandes shell suivantes sur le serveur de production

   $ apache2ctl -M
   $ apache2ctl -V
   $ php -m
   $ php -i
   $ mysql
   > SHOW VARIABLES;

Ceci pour lister les modules d'Apache2 et de PHP installés, et la configuration détaillée d'Apache2, de PHP et de MySQL

Cordialement,
...
