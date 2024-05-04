import "./index.sass";
import { useEffect } from "react";
import { useVisibility } from "../../hooks/useVisibility";
import { fetchNui } from "../../utils/fetchNui";

export const Home: React.FC = () => {
  const { visible, setVisible } = useVisibility();

  useEffect(() => {
    if (!visible) return;
    const keyHandler = (e: KeyboardEvent) => {
      if (["Escape"].includes(e.code)) {
        fetchNui("nui:hideFrame", true, true);
        setVisible(false);
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  }, [visible, setVisible]);

  return (
    <div className="w-full h-full">
      <h1>Home</h1>
    </div>
  );
};
