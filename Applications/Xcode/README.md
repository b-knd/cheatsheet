# Xcode
- Xcode 13
1. [Connecting Xcode to GitHub](#connecting-xcode-to-github)

## Connecting Xcode to GitHub
1. On Xcode, go to **Preference -> Accounts**

    <img src="Media/Screen%20Shot%202022-08-24%20at%209.41.53%20AM.png" width = "900">

2. Click on the **+** icon, select **GitHub** and **continue**

    <img src="Media/Screen%20Shot%202022-08-24%20at%209.40.01%20AM.png" width = "600">


3. Sign in to GitHub
   
   **Account**: Your github username
   
   **Token**  : Personal access token on github (check out on how to generate token [here](https://docs.github.com/en/enterprise-server@3.4/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token))

    <img src="Media/Screen%20Shot%202022-08-24%20at%209.40.13%20AM.png" width = "600">

4. Try creating a new project on xcode (remember to select the option 'create git repository on my mac', then navigate to source control in navigator area, right click on Remotes, select "New <projectname> Remote..."

    <img src="Media/Screen%20Shot%202022-08-24%20at%2010.04.14%20AM.png" width = "400">

    Now, you can push/commit on xcode directly.
