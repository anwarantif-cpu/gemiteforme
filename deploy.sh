#!/bin/bash

echo "🚀 DÉPLOIEMENT AUTOMATIQUE GEMITEFORME"
echo "======================================"
echo ""

# Vérifier si on est dans le bon dossier
if [ ! -f "index.html" ]; then
    echo "❌ Erreur : Vous n'êtes pas dans le dossier Gemiteforme.fr"
    exit 1
fi

# 1. Git add
echo "📦 Ajout des fichiers modifiés..."
git add .

# 2. Git status pour voir ce qui a changé
echo ""
echo "📋 Fichiers modifiés :"
git status --short

# 3. Demander le message de commit
echo ""
read -p "💬 Message de commit : " commit_message

# Si aucun message, utiliser un message par défaut
if [ -z "$commit_message" ]; then
    commit_message="Mise à jour du site"
fi

# 4. Git commit
echo ""
echo "💾 Création du commit..."
git commit -m "$commit_message"

# 5. Git push
echo ""
echo "☁️  Envoi sur GitHub..."
git push origin main

# 6. Déployer sur le serveur
echo ""
echo "🌐 Déploiement sur le serveur Scaleway..."
ssh root@51.159.130.52 'deploy-gemiteforme'

echo ""
echo "✅ DÉPLOIEMENT TERMINÉ AVEC SUCCÈS !"
echo "🌍 Votre site est maintenant à jour sur :"
echo "   → http://51.159.130.52"
echo "   → http://gemiteforme.fr (si DNS configuré)"
