import Topbar from './Topbar';
import Sidebar from './Sidebar';
import BottomBanner from './BottomBanner';
import FaucetBanner from './FaucetBanner';

const Layout = ({ children }) => {
  return (
    <div className="min-h-screen bg-cipher-base text-slate-100 flex flex-col">
      <FaucetBanner />
      <Topbar />
      
      <div className="flex flex-1 pt-16 pb-24 md:pb-8">
        <Sidebar />
        
        <main className="flex-1 px-6 py-8 md:pl-28 xl:pl-72 max-w-7xl">
          {children}
        </main>
      </div>

      <BottomBanner />
    </div>
  );
};

export default Layout;
