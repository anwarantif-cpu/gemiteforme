#!/bin/bash

echo "🚀 Déploiement automatique de Gemiteforme"
echo ""

# 1. Git add, commit, push
echo "📦 Envoi des modifications sur GitHub..."
git add .
read -p "Message de commit: " commit_message
git commit -m "$commit_message"
git push origin main

# 2. Déployer sur le serveur
echo ""
echo "🌐 Mise à jour du serveur Scaleway..."
ssh root@51.159.130.52 'deploy-gemiteforme'

echo ""
echo "✅ Déploiement terminé !"
echo "🌍 Votre site est maintenant à jour sur http://51.159.130.52"
