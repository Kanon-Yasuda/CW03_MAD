import { httpsCallable } from "firebase/functions";
import { functions } from "./firebase.js";

const askQuestCoach = httpsCallable(functions, "askQuestCoach");

export async function getQuestHint(question) {
  const result = await askQuestCoach({
    question: question.slice(0, 300)
  });
  return result.data.reply;
}