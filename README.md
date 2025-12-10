# 🚀 Projeto Robot Framework — API + Web

Este projeto foi criado para praticar testes automatizados usando **Robot Framework**, incluindo cenários reais com **APIs REST** e testes de **interface web**.
Aqui você encontrará a configuração completa, estrutura do projeto, instalação correta do ambiente e uma lista dos **erros mais comuns** durante a instalação do Robot Framework — já com suas soluções.

---

## 📦 Instalação do Robot Framework

# **pre condição ter o python instalado na versão 3.11+**

### Instale o Robot Framework com o Python correto

```bash
py -m pip install robotframework
```

### Instale a RequestsLibrary corretamente

Seu Python está localizado aqui:

```
C:\Program Files\Python314\
```

Então instale usando exatamente esse Python:

```bash
python -m pip install robotframework-requests
```

Se der erro de pip:

```bash
python -m ensurepip --default-pip
python -m pip install robotframework-requests
```

### Verifique se instalou no lugar certo

```bash
python -m pip show robotframework-requests
```

O **Location** deve apontar para:

```
C:\Users\migue\AppData\Roaming\Python\Python314\site-packages
```

---

# 📁 Estrutura de Pastas do Projeto

```
project-root/
│
├── requirements.txt        # Dependências do projeto (opcional)
├── pyproject.toml          # Alternativa para dependências (opcional)
├── README.md               # Documentação do projeto
├── .gitignore              # Arquivos ignorados pelo Git
│
├── tests/                  # Test Suites
│   ├── api/
│   │   └── restful-booker.robot
│   ├── web/
│   │   └── login.robot
│   └── ...
│
├── resources/              # Arquivos reutilizáveis de keywords
│   ├── common.resource
│   ├── api.resource
│   ├── utils.py            # Keywords Python (opcional)
│   └── ...
│
└── libraries/              # Bibliotecas Python personalizadas (opcional)
    └── ...
```

Essa organização facilita manutenção, escalabilidade e deixa o projeto profissional para portfólio.

---

# ⚠️ Possíveis Erros Comuns na Instalação do Robot Framework

A seguir, a lista completa de erros e soluções que **quase sempre aparecem** quando alguém instala o Robot Framework no Windows.

---

## ✅ 1. **“pip não é reconhecido como comando”**

### Erro:

```
pip : O termo 'pip' não é reconhecido...
```

### Causa:

- Python instalado sem “Add Python to PATH”.
- Múltiplas versões do Python.
- PATH usando a versão errada.

### Solução:

```bash
python -m ensurepip --default-pip
python -m pip install robotframework
```

Se nada resolver, reinstale com:
✔ Add to PATH

---

## ✅ 2. **“python não é reconhecido”**

### Erro:

```
python: comando não encontrado
```

### Causa:

- PATH quebrado.

### Solução:

```bash
py --version
py -m pip install robotframework
```

---

## ✅ 3. **ModuleNotFoundError**

### Erro:

```
Importing library X failed: ModuleNotFoundError
```

### Causa:

- VSCode usando Python diferente do terminal.

### Solução:

1. CTRL + SHIFT + P
2. **Python: Select Interpreter**
3. Selecione o mesmo Python que aparece em:

```bash
python --version
```

---

## ✅ 4. **Python incompatível**

### Erro:

```
Could not find a version that satisfies the requirement robotframework
```

### Causa:

- Python novo demais (ex.: 3.14).
- Ou antigo demais.

### Solução:

Use versões estáveis:

- Python 3.10
- Python 3.11
- Python 3.12

---

## ✅ 5. **Erro ao instalar em ambiente virtual**

### Erro:

```
Cannot install in a virtual environment
```

### Solução:

```bash
python -m venv venv
.\venv\Scripts\activate
pip install robotframework
```

---

## ✅ 6. **Permissão negada (WinError 5)**

### Solução:

Executar PowerShell como admin:

```bash
pip install robotframework
```

Ou:

```bash
pip install --user robotframework
```

---

## ✅ 7. **Python no OneDrive / PATH quebrado**

### Problema:

```
No module named X
```

Causa: OneDrive sincronizando pastas e quebrando PATH.

### Solução:

Instalar Python em:

```
C:\Python\Python312\
```

---

## ✅ 8. **Erro ao instalar RequestsLibrary ou SeleniumLibrary**

### Erro:

```
Failed to build wheels
```

### Solução:

```bash
python -m pip install --upgrade pip setuptools wheel
pip install robotframework-requests
pip install robotframework-seleniumlibrary
```

---

## ✅ 9. **Erro de SSL**

### Erro:

```
SSL: CERTIFICATE_VERIFY_FAILED
```

### Solução:

```bash
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org robotframework
```

---

## ✅ 10. **Comando “robot” não reconhecido**

### Solução:

Adicionar no PATH:

```
C:\Users\SEU_USUARIO\AppData\Roaming\Python\Python311\Scripts
```

Ou rodar assim:

```bash
python -m robot tests/
```

---

# 🎯 Objetivo do Projeto

Este projeto tem como finalidade:

- Praticar Robot Framework para **testes de API REST**
- Praticar Robot Framework para **testes web (UI)**
- Criar uma base sólida de estrutura de automação
- Simular um projeto real para ser usado no portfólio
- Evoluir organização, padrões e boas práticas
