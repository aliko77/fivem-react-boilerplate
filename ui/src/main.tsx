import ReactDOM from "react-dom/client";
import App from "./components/App";
import "./index.css";
import { VisibilityProvider } from "./providers/VisibilityProvider";
import { RouterProvider } from "./providers/RouterProvider";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <>
    <VisibilityProvider>
      <RouterProvider>
        <App />
      </RouterProvider>
    </VisibilityProvider>
  </>
);
