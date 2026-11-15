import { onAuthStateChanged } from "firebase/auth";
import { doc, getDoc } from "firebase/firestore";
import { auth, db } from "./firebase.js";

export async function loadToday() {
  const uid = auth.currentUser?.uid;
  if (!uid) throw new Error("Sign in before loading learner progress.");
  const [challenge, progress] = await Promise.all([
    getDoc(doc(db, "challenges", "today")),
    getDoc(doc(db, "users", uid, "progress", "today"))
  ]);
  return { challenge: challenge.data(), progress: progress.data() ?? null };
}