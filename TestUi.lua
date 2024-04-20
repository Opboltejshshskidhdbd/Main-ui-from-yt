-- Services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

-- vars
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

function Library:validate(defaults, options)
    for i, v in pairs(defaults) do
        if options[i] == nil then
            options[i] = v
        end
    end
    return options
end

function Library:tween(object, goal, callback)
    local tween = tweenService:Create(object, tweenInfo, goal)
    tween.Completed:Connect(callback or function() end)
    tween:Play()
end

function Library:Init(options)
    options = Library:validate({
        name = "UI Library Test"
    }, options or {})

    local GUI = {
        CurrentTab = nil
    }

    -- Main Frame
    do

       -- StarterGui.MyLibrary
       GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui)
       GUI["1"]["Name"] = [[MyLibrary]];
       GUI["1"]["IgnoreGuiInset"] = true

       -- StarterGui.MyLibrary.Main
       GUI["2"] = Instance.new("Frame", GUI["1"]);
       GUI["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
       GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
       GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
       GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (Library.Tree["2"].Size.X.Offset / 2), (viewport.Y/2) - (Library.Tree["2"].Size.Y.Offset / 2));
       GUI["2"]["Name"] = [["Main"]];

       -- StarterGui.MyLibrary.Main.UICorner
       GUI["3"] = Instance.new("UICorner", GUI["2"]);
       GUI["3"]["CornerRadius"] = UDim.new(0, 6);

       -- StarterGui.MyLibrary.Main.DropShadowHolder
       GUI["b"] = Instance.new("Frame", GUI["2"]);
       GUI["b"]["ZIndex"] = 0;
       GUI["b"]["BorderSizePixel"] = 0;
       GUI["b"]["BackgroundTransparency"] = 1;
       GUI["b"]["Size"] = UDim2.new(1, 0, 1, 0);
       GUI["b"]["Name"] = [[DropShadowHolder]];

       --StarterGui.MyLibrary.Main. DropShadowHolder.DropShado
       GUI["c"] = Instance.new("ImageLabel", GUI["b"]);
       GUI["c"]["ZIndex"] = 0;
       GUI["c"]["BorderSizePixel"] = 0;
       GUI["c"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
       GUI["c"]["ScaleType"] = Enum.ScaleType.Slice;
       GUI["c"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
       GUI["c"]["ImageTransparency"] = 0.5;
       GUI["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
       GUI["c"]["Image"] = [[rbxassetid://6015897843]];
       GUI["c"]["Size"] = UDim2.new(1, 44, 1, 44);
       GUI["c"]["BackgroundTransparency"] = 1;
       GUI["c"]["Name"] = [[DropShadow]];
       GUI["c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

       -- StarterGui.MyLibrary.Main.TopBar
       GUI["4"] = Instance.new("Frame", GUI["2"]);
       GUI["4"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
       GUI["4"]["Size"] = UDim2.new(1, 0, 0, 30);
       GUI["4"]["Name"] = [[TopBar]];

       -- StarterGui.MyLibrary.Main.TopBar.UICorner
       GUI["5"] = Instance.new("UICorner", GUI["4"]);
       GUI["5"]["CornerRadius"] = UDim.new(0, 6);

       -- StarterGui.MyLibrary.Main.TopBar.Extension
       GUI["6"] = Instance.new("Frame", GUI["4"]);
       GUI["6"]["BorderSizePixel"] = 0;
       GUI["6"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
       GUI["6"]["AnchorPoint"]= Vector2.new(0, 1);
       GUI["6"]["Size"] = UDim2.new(1, 0, 0.5, 8);
       GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0);
       GUI["6"]["Name"] = [[Extension]];

       -- StarterGui.MyLibrary.Main.TopBar.Title
       GUI["7"] = Instance.new("TextLabel", GUI["4"]);
       GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
       GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
       GUI["7"]["TextSize"] = 14;
       GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
       GUI["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
       GUI["7"]["Text"] = options["name"];  -- Updated key to "name"
       GUI["7"]["Name"] = "Title";  -- Use a fixed string for the Name
       GUI["7"]["Font"] = Enum.Font.Gotham;
       GUI["7"]["BackgroundTransparency"] = 1;

       --MyLibrary.Main.TopBar.Title.UIPadding
       GUI["8"] = Instance.new("UIPadding", GUI ["7"]);
       GUI["8"]["PaddingTop"] = UDim.new(0, 1);
       GUI["8"]["PaddingLeft"] = UDim.new(0, 8);

       -- StarterGui.MyLibrary.Main.TopBar.Close
       GUI["9"] = Instance.new("ImageLabel", GUI["4"]);
       GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
       GUI["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
       GUI["9"]["Image"] = [[rbxassetid://10884453403]];
       GUI["9"]["Size"] = UDim2.new(0, 14, 0, 14);
       GUI["9"]["Name"] = [[Close]];
       GUI["9"]["BackgroundTransparency"] = 1;
       GUI["9"]["Position"] = UDim2.new(1, -8, 0.5, 0);

       -- StarterGui.MyLibrary.Main.TopBar.Line
       GUI["a"] = Instance.new("Frame", GUI["4"]);
       GUI["a"]["BorderSizePixel"] = 0;
       GUI["a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
       GUI["a"]["AnchorPoint"] = Vector2.new(0, 1);
       GUI["a"]["Size"] = UDim2.new(1, 0, 0, 1);
       GUI["a"]["Position"] = UDim2.new(0, 0, 1, 0);
       GUI["a"]["Name"] = [[Line]];

       -- StarterGui.MyLibrary.Main.ContentContainer
       GUI["1b"] = Instance.new("Frame" , GUI["2"]);
       GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
       GUI["1b"]["AnchorPoint"] = Vector2.new(1, 0);
       GUI["1b"]["BackgroundTransparency"] = 1;
       GUI["1b"]["Size"] = UDim2.new(1, -133, 1, -42);
       Gui["1b"]["Position"] = UDim2.new(1, -6, 0, 36);
       GUI["1b"]["Name"] = [[ContentContainer]];
    end

   -- Navigation
   do

       -- StarterGui.MyLibrary.Main.Navigation
       GUI["d"] = Instance.new("Frame", GUI[2]);
       GUI["d"]["BordeSizePixel"] = 0;
       GUI["d"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
       GUI["d"]["Size"] = UDim2.new(0, 120, 1, -30);
       GUI["d"]["Position"] = UDim2.new(0, 0, 0, 30);
       GUI["d"]["Name"] = [[Navigation]];

       -- StarterGui.MyLibrary.Main.Navigation.UICorner
       GUI["e"] = Instance.new("UICorner", GUI["d"]);
       GUI["e"]["CornerRadius"] = UDim.new(0, 6);

       -- StarterGui.MyLibrary.Main.Navigation.Hide
       GUI["f"] = Instance.new("Frame", GUI["d"]);
       GUI["f"]["BorderSizePixel"] = 0;
       GUI["f"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
       GUI["f"]["Size"] = UDim2.new(1, 0, 0, 20);
       GUI["f"]["Name"] = [[Hide]];

       -- StarterGui.MyLibrary.Main.Navigation.Hide2
       GUI["10"] = Instance.new("Frame", GUI["d"]);
       GUI["10"]["BorderSizePixel"] = 0
       GUI["10"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
       GUI["10"]["AnchorPoint"] = Vector2.new(1, 0);
       GUI["10"]["Size"] = UDim2.new(0, 20, 1, 0);
       GUI["10"]["Position"] = UDim2.new(1, 0, 0, 0);
       GUI["10"]["Name"] = [[Hide2]];

       -- StarterGui.MyLibrary.Main.Navigation.ButtonHolder
       GUI["11"] = Instance.new("Frame", GUI["d"]);
       GUI["11"]["BackgrounColor3"] = Color3.fromRGB(255, 255, 255);
       GUI["11"]["BackgroundTransparency"] = 1;
       GUI["11"]["Size"] = UDim2.new(1, 0, 1, 0);
       GUI["11"]["Name"] = [[ButtonHolder]];

       -- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIPadding
       GUI["12"] = Instance.new("UIPadding", GUI["11"]);
       GUI["12"]["PaddingTop"] = UDim.new(0, 4);
       GUI["12"]["PaddingBottom"] = UDim.new(0, 4);
       GUI["12"]["PaddingRight"] = UDim.new(0, 4);
       GUI["12"]["PaddingLeft"] = UDim.new(0, 4);

       -- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIListLayout
       GUI["13"] = Instance.new("UIListLayout", GUI["11"]);
       GUI["13"]["Padding"] = UDim.new(0, 1)
       GUI["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

       -- StarterGui.MyLibrary.Main.Navigation.Line
       GUI["1a"] = Instance.new("Frame", GUI["d"]);
       GUI["1a"]["BorderSizePixel"] = 0;
       GUI["1a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
       GUI["1a"]["Size"] = UDim2.new(0, 1, 1, 0);
       GUI["1a"]["Position"] = UDim2.new(1, 0, 0, 0)
       GUI["1a"]["Name"] = [[Line]];
    end

    function GUI:CreateTab(options)
        options = Library:validate({
            name = "Test Tab",
            icon = "rbxassetid://10888331510"
        }, options or {})

        local Tab = {
            Hover = false,
            Activate = false
        }


     -- Render
     do
        -- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive
        Tab["17"] = Instance.new("Frame", GUI["11"]);
        Tab["17"]["BorderSizePixel"] = 0;
        Tab["17"]["TextAlignment"] = Enum.TextAlignment.Left;
        Tab["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
        Tab["17"]["TextSize"] = 12;
        Tab["17"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
        Tab["17"]["Size"] = UDim2.new(1, 0, 0, 24);
        Tab["17"]["Text"] = options.name;
        Tab["17"]["Name"] = [[Inactive]];
        Tab["17"]["Font"] = Enum.Font.Ubuntu;
        Tab["17"]["BackgroundTransparency"] = 1;

        -- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive.UIPadding
        Tab["18"] = Instance.new("UIPadding", Tab["17"]);
        Tab["18"]["PaddingTop"] = UDim.new(0, 28);

        -- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive.Icon
        Tab["19"] = Instance.new("ImageLabel", Tab["17"]);
        Tab["19"]["BackgrondColor3"] = Color3.fromRGB(255, 255, 255);
        Tab["19"]["ImageColor3"] = Color3.fromRGB(200, 200, 200);
        Tab["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
        Tab["19"]["Image"] = options.icon;
        Tab["19"]["Size"] = UDim2.new(0, 20, 0, 20);
        Tab["19"]["Name"] = [[Icon]];
        Tab["19"]["BackgroundTransparency"] = 1;
        Tab["19"]["Position"] = UDim2.new(0, -24, 0.5, 0);

        -- StarterGui.MyLibrary.Main.ContentContainer.HomeTab
        Tab["1c"] = Instance.new("ScrollingFrame", Tab["1b"]);
        Tab["1c"]["BorderSizePixel"] = 0;
        Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
        Tab["1c"]["BackgroundTransparency"] = 1;
        Tab["1c"]["Size"] = UDim2.new(1, 0, 1, 0)
        Tab["1c"]["Selectable"] = false;
        Tab["1c"]["ScrollBarThickness"] = 0;
        Tab["1c"]["Name"] = [[HomeTab]];
        Tab["1c"]["SelectionGroup"] = false;
        Tab["1c"]["Visible"] = false;
    end
     -- Methods
     function Tab:Actiavte()
         if not Tab.Activate then
             if GUI.CurrentTab ~= nil then
                 GUI.CurrentTab:Deactivate()
             end
      
             Tab.Activate = true
             Library:tween(Tab["17"], {BackgroundTransparency = .8})
             Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
             Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
             Tab["1c"].Visible = true
            GUI.CurrentTab = Tab
         end
     end
    
     function Tab:Deactivate()
         if Tab.Activate then
             Tab.Activate = false
             Tab.Hover = false
             Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
             Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
             Library:tween(Tab["17"], {BackgroundTransparency = 1})
             Tab["1c"].Visible = false
         end
     end

     -- Logic
    
     do
         Tab["17"].MouseEnter:Connect(function()
            Tab.Hover = true

        if not Tab.Activate then
            Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
            Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
        end
    end)

        Tab["17"].MouseLeave:Connect(function()
            Tab.Hover = false

            if not Tab.Activate then
                Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
                Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
            end
        end)

        uis.InputBegan:Connect(function(input, gpe))
            if gpe then return end
      
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if Tab.Hover then
                   Tab.Activate()
                end
            end
        end)

        if GUI.CurrentTab == nil then
            Tab:Actiavte()
        end
  
        return Tab
    end

    return GUI
end


local main = Library:Init {
    name = "MyLibrary",
}

local tab = main:CreateTab()
local tab1 = main:CreateTab({name = "Key"})