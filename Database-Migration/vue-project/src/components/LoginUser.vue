<script setup lang="ts">
import { ref } from 'vue'
import InputGroup from 'primevue/inputgroup'
import InputGroupAddon from 'primevue/inputgroupaddon'
import FloatLabel from 'primevue/floatlabel'
import InputText from 'primevue/inputtext'

const username = ref('')
const password = ref('')
const loading = ref(false)

function onSubmit() {
  loading.value = true
  // placeholder: replace with real auth call
  setTimeout(() => {
    loading.value = false
    // eslint-disable-next-line no-console
    console.log('login', { username: username.value, password: password.value })
  }, 600)
}
</script>
<template>
  <div class="login-card">
    <header class="login-header">
      <h2>Welcome back</h2>
      <p class="sub">Sign in to your Kansas First Bank account</p>
    </header>

    <form class="login-form" @submit.prevent="onSubmit">
      <div class="field">
        <InputGroup>
          <InputGroupAddon>
            <i class="pi pi-user"></i>
          </InputGroupAddon>
          <FloatLabel>
            <InputText id="username" v-model="username" autocomplete="username" />
            <label for="username">Username</label>
          </FloatLabel>
        </InputGroup>
      </div>

      <div class="field">
        <InputGroup>
          <InputGroupAddon>
            <i class="pi pi-lock"></i>
          </InputGroupAddon>
          <FloatLabel>
            <InputText id="password" type="password" v-model="password" autocomplete="current-password" />
            <label for="password">Password</label>
          </FloatLabel>
        </InputGroup>
      </div>

      <div class="actions">
        <button type="submit" class="btn" :disabled="loading">
          <span v-if="!loading">Sign In</span>
          <span v-else>Signing…</span>
        </button>
      </div>
    </form>

    <footer class="login-foot">
      <a href="#" class="link">Forgot password?</a>
    </footer>
  </div>
</template>

<style scoped>
.login-card {
  max-width: 380px;
  margin: 0.5rem auto;
  padding: 1.5rem;
  border-radius: 12px;
  background: linear-gradient(180deg, rgba(255,255,255,0.85), rgba(250,250,250,0.95));
  box-shadow: 0 8px 24px rgba(16,24,40,0.08);
}
.login-header h2 {
  margin: 0 0 4px 0;
  font-size: 1.25rem;
  color: #0f3f76;
}
.sub {
  margin: 0 0 0.5rem 0;
  font-size: 0.9rem;
  color: #334155;
}
.login-form {
  display: grid;
  gap: 0.85rem;
}
.field :deep(.p-inputgroup) {
  width: 100%;
}
.field i.pi {
  font-size: 1.05rem;
  color: #15317a;
}
/* style native input inside Prime components as fallback */
.field input {
  width: 100%;
  padding: 0.6rem 0.5rem;
  border-radius: 8px;
  border: 1px solid #e6e9ee;
  background: transparent;
}
.actions {
  display: flex;
  justify-content: stretch;
  margin-top: 0.25rem;
}
.btn {
  width: 100%;
  padding: 0.75rem 1rem;
  border-radius: 10px;
  background: linear-gradient(90deg,#3683af,#056196);
  color: white;
  font-weight: 600;
  border: none;
  cursor: pointer;
}
.btn:disabled { opacity: 0.7; cursor: wait; }
.login-foot { text-align: center; margin-top: 0.75rem; }
.link { color: #0f2576; text-decoration: none; font-size: 0.9rem; }
</style>