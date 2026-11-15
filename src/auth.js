import {
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
  signOut
} from "firebase/auth";
import { auth } from "./firebase.js";

export const register = (email, password) =>
  createUserWithEmailAndPassword(auth, email, password);

export const signIn = (email, password) =>
  signInWithEmailAndPassword(auth, email, password);

export const logOut = () => signOut(auth);