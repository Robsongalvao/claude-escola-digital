import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { AuthProvider } from './context/AuthContext'
import RotaProtegida from './components/RotaProtegida'
import RotaAdmin from './components/RotaAdmin'
import Landing from './pages/Landing'
import Login from './pages/Login'
import Cadastro from './pages/Cadastro'
import Painel from './pages/Painel'
import TrilhaAluno from './pages/TrilhaAluno'
import CursosAluno from './pages/CursosAluno'
import Aula from './pages/Aula'
import ProjetoFinal from './pages/ProjetoFinal'
import Certificado from './pages/Certificado'
import AdminLayout from './pages/admin/AdminLayout'
import AdminDashboard from './pages/admin/AdminDashboard'
import AdminCursos from './pages/admin/AdminCursos'
import AdminAlunos from './pages/admin/AdminAlunos'

export default function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          <Route path="/" element={<Landing />} />
          <Route path="/entrar" element={<Login />} />
          <Route path="/cadastro" element={<Cadastro />} />
          <Route
            path="/painel"
            element={
              <RotaProtegida>
                <Painel />
              </RotaProtegida>
            }
          />
          <Route
            path="/aluno/:studentId"
            element={
              <RotaProtegida>
                <CursosAluno />
              </RotaProtegida>
            }
          />
          <Route
            path="/aluno/:studentId/curso/:courseSlug"
            element={
              <RotaProtegida>
                <TrilhaAluno />
              </RotaProtegida>
            }
          />
          <Route
            path="/aluno/:studentId/curso/:courseSlug/aula/:lessonId"
            element={
              <RotaProtegida>
                <Aula />
              </RotaProtegida>
            }
          />
          <Route
            path="/aluno/:studentId/curso/:courseSlug/projeto-final"
            element={
              <RotaProtegida>
                <ProjetoFinal />
              </RotaProtegida>
            }
          />
          <Route
            path="/aluno/:studentId/curso/:courseSlug/certificado"
            element={
              <RotaProtegida>
                <Certificado />
              </RotaProtegida>
            }
          />
          <Route
            path="/admin"
            element={
              <RotaAdmin>
                <AdminLayout />
              </RotaAdmin>
            }
          >
            <Route index element={<AdminDashboard />} />
            <Route path="cursos" element={<AdminCursos />} />
            <Route path="alunos" element={<AdminAlunos />} />
          </Route>
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  )
}
