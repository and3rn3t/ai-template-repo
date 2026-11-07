// Shared and3rn3t rules (React hooks, react-refresh, typescript-eslint).
// Add repo-specific rules after the spread.
import and3rn3t from '@and3rn3t/eslint-config';

export default [...and3rn3t, { ignores: ['dist/', 'coverage/', '.wrangler/'] }];
