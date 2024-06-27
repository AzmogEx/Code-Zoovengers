# 🏠 Page accueil

> Page d'accueil avec le compte à rebours, l'affichage du code final, le boutton d'aide et la navigation bar pour se déplacer entre les pages

<figure><img src="../../../../../../.gitbook/assets/Capture d’écran 2024-06-27 à 15.58.55.png" alt="" width="173"><figcaption><p>Page d'accueil</p></figcaption></figure>

***

<figure><img src="../../../../../../.gitbook/assets/Capture d’écran 2024-06-27 à 16.05.13.png" alt=""><figcaption><p>Timer</p></figcaption></figure>

{% hint style="warning" %}
La gestion du timer est automatique. Cependant, la sauvegarde entre chaque page était impossible. Pour y remédier, toutes les 200 millisecondes (soit 5 fois par secondes), nous enregistrons le temps restant dans une variable. Lors du changement de page, nous restaurons cette valeur dans le timer pour afficher de nouveau la valeur correcte et ne pas reset le timer.
{% endhint %}

***

<figure><img src="../../../../../../.gitbook/assets/Capture d’écran 2024-06-27 à 16.05.07.png" alt=""><figcaption><p>Code final d'extraction:</p></figcaption></figure>

{% hint style="success" %}
Le code est également géré par une variable de type liste, à chaque énigme résolue, un mot est ajouté à la variable "mdpfinal". Pour chaque mot dans cette variable, un chiffre correspondant est affiché, formant ainsi les 5 chiffres du mot de passe final. Cette méthode garantit que le mot de passe complet ne sera affiché que si toutes les énigmes sont résolues.
{% endhint %}

***

<figure><img src="../../../../../../.gitbook/assets/Capture d’écran 2024-06-27 à 16.09.00.png" alt=""><figcaption><p>Navigation bar</p></figcaption></figure>

{% hint style="info" %}
Cette barre de navigation nous permettra de naviguer à travers les différentes pages de l'application, telles que "Énigmes", "Décryptek" et "Mot de passe final". Elle sera présente sur les pages principales pour faciliter l'accès.
{% endhint %}
