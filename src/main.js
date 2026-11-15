import { onAuthStateChanged } from "firebase/auth";
import { auth } from "./firebase.js";

onAuthStateChanged(auth, (user) => {
  clearPrivateProgress();
  if (user) {
    showChallengeView(user);
    loadChallengeAndProgress(user);
  } else {
    showSignInView();
  }
});






document.querySelector("#ask-coach").addEventListener("click", async () => {
  const status = document.querySelector("#coach-status");
  status.textContent = "Thinking…";
  try {
    const question = document.querySelector("#coach-question").value;
    status.textContent = await getQuestHint(question);
  } catch (error) {
    console.error("Quest Coach request failed.", error);
    status.textContent = "The coach is unavailable. Try again later.";
  }
});