local sentences = {
	"Enjoying coffee while waiting for gradle...",
	"Googling error messages...",
	"Fighting with merge conflicts...",
	"Running on caffeine and deadlines...",
	"Pretending to understand the codebase...",
	"Arguing with the linter...",
	"Stack Overflow copy-paste champion...",
	"Untangling callback hell...",
	"Optimizing things that don't need optimizing...",
	"Committing with 'fix' as the message...",
	"Brewing another cup of code...",
	"Convincing the compiler to cooperate...",
	"Lost in a sea of terminal output...",
	"Pretending the bug was a feature...",
	"Rewriting history with git rebase...",
	"Fighting the dependency tree...",
	"Yelling at the CI/CD pipeline...",
	"Converting bugs into features...",
	"Surviving on Stack Overflow wisdom...",
	"Making it work before making it right...",
	"コードをデバッグ中...",
	"コーヒーを飲みながらコンパイル待ち...",
	"バグと戦っている...",
	"リファクタリング中...",
	"無限ループにハマった...",
	"코드 디버깅 중...",
	"커피 마시면서 빌드 대기 중...",
	"버그와 싸우는 중...",
	"리팩토링 중...",
	"무한 루프에 빠졌어요...",
	"تصحيح الأخطاء...",
	"بانتظار التجميع مع القهوة...",
	"محاربة الباقات...",
	"إعادة هيكلة الكود...",
	"عالق في حلقة لا نهائية...",
	"Kod hata ayıklanıyor...",
	"Kahve eşliğinde derleme bekleniyor...",
	"Buglarla savaş...",
	"Kod yeniden düzenleniyor...",
	"Sonsuz döngüde sıkıştı...",
}

local last_sentence = nil
local last_change_time = 0
local COOLDOWN = 10

local function random_text()
	local now = os.time()
	if now - last_change_time >= COOLDOWN then
		last_sentence = sentences[math.random(#sentences)]
		last_change_time = now
	end
	return last_sentence
end

return {
	"vyfor/cord.nvim",
	---@type CordConfig
	opts = {
		editor = {
			client = "1500891115832742108",
			tooltip = "Experimenting...",
			icon = "https://avatars.githubusercontent.com/u/277474716?s=1000&v=4",
		},
		idle = {
			icon = "https://avatars.githubusercontent.com/u/277474716?s=1000&v=4",
			show_status = false,
			timeout = 300000, -- 5 minutes
		},
		display = {
			view = "auto",
		},
		text = {
			workspace = "On earth",
			default = random_text,
			viewing = random_text,
			editing = random_text,
			file_browser = random_text,
			plugin_manager = random_text,
			lsp = random_text,
			docs = random_text,
			vcs = random_text,
			notes = random_text,
			debug = random_text,
			test = random_text,
			diagnostics = random_text,
			games = random_text,
			terminal = random_text,
			dashboard = random_text,
		},
	},
}
