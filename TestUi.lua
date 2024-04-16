-- Services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

local Library = {}
Library.Tree = {}

function Library:validate(defaults, options)
    for i, v in pairs(defaults) do
        if options[i] == nil then
            options[i] = v
        end
    end
    return options
end

function Library:new(options)
    options = Library:validate({
        name = "UI Library Test"
    }, options or {})

    -- StarterGui.MyLibrary
    Library.Tree["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui)
    Library.Tree["1"]["Name"] = [[MyLibrary]];
    Library.Tree["1"]["IgnoreGuiInset"] = true

    -- StarterGui.MyLibrary.Main
    Library.Tree["2"] = Instance.new("Frame", Library.Tree["1"]);
    Library.Tree["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
    Library.Tree["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Library.Tree["2"]["Size"] = UDim2.new(0, 400, 0, 300);
    Library.Tree["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    Library.Tree["2"]["BorderSizePixel"] = 1;
    Library.Tree["2"]["BorderColor3"] = Color3.fromRGB(255, 0, 0);
    Library.Tree["2"]["Name"] = [["Main"]];

    -- StarterGui.MyLibrary.Main.UICorner
    Library.Tree["3"] = Instance.new("UICorner", Library.Tree["2"]);
    Library.Tree["3"]["CornerRadius"] = UDim.new(B, 6);

    -- StarterGui.MyLibrary.Main.DropShadowHolder
    Library.Tree["b"] = Instance.new("Frame", Library.Tree["2"]);
    Library.Tree["b"]["ZIndex"] = 0;
    Library.Tree["b"]["BorderSizePixel"] = 0;
    Library.Tree["b"]["BackgroundTransparency"] = 1;
    Library.Tree["b"]["Size"] = UDim2.new(1, 0, 1, 0);
    Library.Tree["b"]["Name"] = [[DropShadowHolder]];

    --StarterGui.MyLibrary.Main. DropShadowHolder.DropShado
    Library.Tree["c"] = Instance.new("ImageLabel", Library.Tree["b"]);
    Library.Tree["c"]["ZIndex"] = 0;
    Library.Tree["c"]["BorderSizePixel"] = 0;
    Library.Tree["c"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
    Library.Tree["c"]["ScaleType"] = Enum.ScaleType.Slice;
    Library.Tree["c"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
    Library.Tree["c"]["ImageTransparency"] = 0.5;
    Library.Tree["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Library.Tree["c"]["Image"] = [[rbxassetid://6015897843]];
    Library.Tree["c"]["Size"] = UDim2.new(1, 44, 1, 44);
    Library.Tree["c"]["Name"] = [[DropShadow]];
    Library.Tree["c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    -- StarterGui.MyLibrary.Main.TopBar
    Library.Tree["4"] = Instance.new("Frame", Library.Tree["2"]);
    Library.Tree["4"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
    Library.Tree["4"]["Size"] = UDim2.new(1, 0, 0, 30);
    Library.Tree["4"]["Name"] = [[TopBar]];

    -- StarterGui.MyLibrary.Main.TopBar.UICorner
    Library.Tree["5"] = Instance.new("UICorner", Library.Tree["4"]);
    Library.Tree["5"]["CornerRadius"] = UDim.new(0, 6);

    -- StarterGui.MyLibrary.Main.TopBar.Extension
    Library.Tree["6"] = Instance.new("Frame", Library.Tree["4"]);
    Library.Tree["6"]["BorderSizePixel"] = 0;
    Library.Tree["6"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
    Library.Tree["6"]["AnchorPoint"]= Vector2.new(0, 1);
    Library.Tree["6"]["Size"] = UDim2.new(1, 0, 0.5, 8);
    Library.Tree["6"]["Position"] = UDim2.new(0, 0, 1, 0);
    Library.Tree["6"]["Name"] = [[Extension]];

    -- StarterGui.MyLibrary.Main.TopBar.Title
    Library.Tree["7"] = Instance.new("TextLabel", Library.Tree["4"]);
    Library.Tree["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Library.Tree["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Library.Tree["7"]["TextSize"] = 14;
    Library.Tree["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    Library.Tree["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
    Library.Tree["7"]["Text"] = options["Name"];
    Library.Tree["7"]["Name"] = options["Name"];
    Library.Tree["7"]["Font"] = Enum.Font.Gotham;
    Library.Tree["7"]["BackgroundTransparency"] = 1;
  
    --MyLibrary.Main.TopBar.Title.UIPadding
    Library.Tree["8"] = Instance.new("UIPadding", Library.Tree ["7"]);
    Library.Tree["8"]["PaddingTop"] = UDim.new(0, 1);
    Library.Tree["8"]["PaddingLeft"] = UDim.new(0, 8);

    -- StarterGui.MyLibrary.Main.TopBar.Close
    Library.Tree["9"] = Instance.new("ImageLabel", Library.Tree["4"]);
    Library.Tree["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Library.Tree["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
    Library.Tree["9"]["Image"] = [[rbxassetid://10884453403]];
    Library.Tree["9"]["Size"] = UDim2.new(0, 14, 0, 14);
    Library.Tree["9"]["Name"] = [[Close]];
    Library.Tree["9"]["BackgroundTransparency"] = 1;
    Library.Tree["9"]["Position"] = UDim2.new(1, -8, 0.5, 0);

    -- StarterGui.MyLibrary.Main.TopBar.Line
    Library.Tree["a"] = Instance.new("Frame", Library.Tree["4"]);
    Library.Tree["a"]["BorderSizePixel"] = 0;
    Library.Tree["a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
    Library.Tree["a"]["AnchorPoint"] = Vector2.new(0, 1);
    Library.Tree["a"]["Size"] = UDim2.new(1, 0, 0, 1);
    Library.Tree["a"]["Position"] = UDim2.new(0, 0, 1, 0);
    Library.Tree["a"]["Name"] = [[Line]];
end

Library:new()