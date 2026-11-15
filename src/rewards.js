import { httpsCallable } from "firebase/functions";
import { functions } from "./firebase.js";

const completeToday = httpsCallable(functions, "completeToday");

export async function completeChallenge() {
  const result = await completeToday({ challengeId: "today" });
  showReward(result.data);
}