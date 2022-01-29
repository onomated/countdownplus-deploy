import {Layout} from 'antd';
import styled from 'styled-components';
import tw from 'tailwind-styled-components';
import Logo from '../../../components/Logo';
import ContentHeader from './ContentHeader';
import SideMenu from './SideMenu';

const {Content, Sider} = Layout;

const Container = tw(Layout)`
  h-full
`;

const FixedSider = tw(Sider)`
  fixed
  left-0
  h-screen
`;

const LogoContainer = styled.div`
  height: var(--layout-header-height);
  display: flex;
  justify-content: center;
  align-items: center;
`;

const SideMenuContainer = styled.div`
  padding-top: 0.5rem;
  height: calc(100% - var(--layout-header-height));
  overflow: auto;
  ::-webkit-scrollbar {
    width: 6px;
  }
  ::-webkit-scrollbar-thumb {
    background: rgba(0, 0, 0, 0.12);
  }
`;

const ContentSection = styled(Layout)`
  padding-left: 200px;
`;

const ContentContainer = tw(Content)`
  px-4
  py-6
  w-full
  overflow-auto
`;

const AdminLayout = ({children, selectedMenuKey}) => (
  <Container>
    <Layout>
      <FixedSider>
        <LogoContainer className="border-b">
          <Logo sm />
        </LogoContainer>
        <SideMenuContainer className="border-r pr-px">
          <SideMenu selectedMenuKey={selectedMenuKey} />
        </SideMenuContainer>
      </FixedSider>

      <ContentSection>
        <ContentHeader />
        <ContentContainer>{children}</ContentContainer>
      </ContentSection>
    </Layout>
  </Container>
);

export default AdminLayout;
