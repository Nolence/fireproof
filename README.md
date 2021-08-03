[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

##  fireproof
Provides easy to use abstractions over common firebase libraries
- [ ] fireproof_auth
- [x] fireproof_firestore
- [ ] fireproof_storage

##  fireproof_riverpod
Wraps the functionality of fireproof into easy to handle riverpod abstractions

- [ ] fireproof_riverpod_auth (relies on fireproof_auth)
- [x] fireproof_riverpod_firestore (relies on fireproof_firestore)
- [ ] fireproof_riverpod_storage (relies on fireproof_storage)

## hooks_fireproof
Provides `flutter_hooks` hooks for common scenerios around common firebase packages
- [ ] [hooks_fireproof_auth](https://github.com/CSFrequency/react-firebase-hooks/tree/master/auth)
    <!-- - [ ] useAuth (likely returns an auth object no?) -->
    - [ ] useAuthState
    - [ ] useCreateUserWithEmailAndPassword
    - [ ] useSignInWithEmailAndPassword
- [ ] [hooks_fireproof_firestore](https://github.com/CSFrequency/react-firebase-hooks/tree/master/firestore)
    - [ ] useCollection
    - [ ] useCollectionOnce
    - [ ] useCollectionData
    - [ ] useCollectionDataOnce
    - [ ] useDocument
    - [ ] useDocumentOnce
    - [ ] useDocumentData
    - [ ] useDocumentDataOnce
- [x] [hooks_fireproof_storage](https://github.com/CSFrequency/react-firebase-hooks/tree/master/storage)
    <!-- useDownloadURL -->
    - [x] useFile
    - [x] useFiles
    - [x] useStorageFile
    - [x] useStorageFiles


TODO:

(These were due to not thinking through the unnecessary dependencies this way would require)
- [ ] Delete and archive fireproof
- [ ] Delete and archive fireproof_rivperpod
- [ ] Add example with setup instructions