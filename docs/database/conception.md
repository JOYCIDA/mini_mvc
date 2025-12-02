réponses aux questions

1. Pourquoi stocker le prix unitaire dans la table des lignes de commande plutôt que d'utiliser directement le prix du produit ?

Le prix d'un produit peut changer dans le temps. Pour garder un historique fidèle de la transaction, on stocke unit_price et product_name dans order_lines. Ainsi chaque commande conserve le montant réel payé au moment de la commande.

2. Quelle stratégie de suppression pour chaque relation et justification

products.category_id vers categories.id : ON supprime RESTRICT
  - Justification : on évite la suppression d'une catégorie qui contient encore des produits pour ne pas créer d'incohérences. L'administrateur doit d'abord réaffecter ou supprimer les produits.
orders.customer_id vers customers.id : ON supprime SET NULL
  - Justification : pour conserver l'historique des commandes même si le client est supprimé. On met le customer_id à NULL mais on garde l'adresse et les montants.
order_lines.order_id vers orders.id : ON supprime CASCADE
  - Justification : si une commande est supprimée, ses lignes doivent l'être automatiquement.
order_lines.product_id vers products.id : ON supprime SET NULL
  - Justification : on conserve l'historique des lignes de commande ; si un produit est supprimé, on met product_id à NULL pour garder la ligne.
Soft delete (deleted_at) sur products et customers
  - Justification : permet restauration et audits. Les enregistrements restent mais sont ignorés par défaut côté application.

3. Gestion des stocks

Rupture de stock : l'application doit empêcher la validation d'une commande si la quantité demandée dépasse le stock disponible, et afficher un message d'erreur au client.


4. Index prévus et pourquoi
- products(category_id) : pour accélérer les requêtes listant les produits d'une catégorie.
- order_lines(order_id) : pour récupérer rapidement les lignes d'une commande.
- order_lines(product_id) : pour requêtes analytiques .
- orders(order_number) UNIQUE : recherche rapide par numéro de commande .
- customers(email) UNIQUE : lookup rapide et garantie d'unicité d'email.

5. Unicité du numéro de commande

- On définit order_number UNIQUE dans la table orders.
- Génération recommandée : préfixe , année et compteur séquentiel. S'assurer de la génération atomique  pour éviter doublons.

6. Extensions possibles

- Plusieurs adresses par client vers table customer_addresses (id, customer_id, label, address, city, postal_code, is_default).
- Historique des prix vers table `product_prices` (product_id, price, start_at, end_at).
- Avis clients verstable `reviews` (id, product_id, customer_id, rating, comment, created_at).
- Images multiples par produit vers table `product_images` (id, product_id, url, position).
- Gestion des retours, bons de réduction, wishlist.
